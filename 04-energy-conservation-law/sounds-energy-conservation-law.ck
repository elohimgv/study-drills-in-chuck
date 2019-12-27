// Author: Elohim
// program name: sounds-energy-coservation-law.ck
/*
* A short description of energy conservation law:
* Fisrt principle of thermodynamic that announced that
* the total quantity of energy in any isolated system,
* it remains unchanged over time, although energy can be 
* transformed into another form of energy.
*
* Energy is not created or destroyed, it only transforms.
*
* My relfection: The total quantity of energy in a isolated
* human, it remains unchanged over time, although energy can
* be transformed into another form of energy. ¿What happend
* if the human interact with others? 
*/

// Sound chain UGens
Gain master => dac;
SqrOsc clar => Envelope env => master;
SndBuf2 toy_piano_key => master;
SndBuf hihat => master;
SndBuf kick => master;

me.dir() + "/audio/toy_piano_key.wav" => toy_piano_key.read;
me.dir() + "/audio/hihat_02.wav" => hihat.read;
me.dir() + "/audio/kick_02.wav" => kick.read;

// Duration of sample
toy_piano_key.samples()::samp => dur duration_sample;
// Playheads to end so no sound is made
toy_piano_key.samples() => toy_piano_key.pos;
hihat.samples() => hihat.pos;
kick.samples() => kick.pos;

// A note duration
0.2::second => dur noteDuration;
noteDuration => dur space;
// A point in time (duration of melodyDuration from now)
now + noteDuration => time melodyDuration;

function void clarinet(int repe) {
    0 => int cicle;
    while (cicle < repe) {
        // Set frequency
        50.0 => clar.freq;
        while (clar.freq() < 230.0) {
            // Set volume
            0.1 => master.gain;
            // Trigger envelope
            1 => env.keyOn;
            // Advance time
            noteDuration => now;
            // Tell the envelope to ramp down
            1 => env.keyOff;
            // Hang out some more
            space => now;
            clar.freq() + 30 => clar.freq;
            <<<"note: ",clar.freq()>>>;
            //<<<(now - melodyDuration) / second>>>;  
        }
    
        // Sequencer
        0 => int counter;
        while (counter < 24) {
            counter % 24 => int beat;
            if (beat == 0 || beat == 7 || beat == 13) {
                playClarinetAndSoundFile(0.2::second, 170.0, hihat);
            } else if (beat == 1 || beat == 6 || beat == 12) {
                playClarinetAndSoundFile(0.2::second, 140.0, hihat);   
            } else if (beat == 2 || beat == 8 || beat == 14) {
                playClarinetAndSoundFile(0.2::second, 110.0, hihat);
            } else if (beat == 3 || beat == 10 || beat == 16) {
                playClarinetAndSoundFile(0.2::second, 80.0, hihat);
            } else if (beat == 4 || beat == 9 || beat == 15) {
                playClarinetAndSoundFile(0.2::second, 200.0, kick);
            } else if (beat == 5 || beat == 11 || beat == 17) {
                playClarinetAndSoundFile(0.2::second, 230.0, kick);
            } else if (beat == 19) {
                playClarinet(0.5::second, 170.0);
            } else if (beat == 18) {
                playClarinet(0.4::second, 140.0); 
            } else if (beat == 20) {
                playClarinetAndSoundFile(0.1::second, 110.0, kick);
            } else if (beat == 21) {
                playClarinetAndSoundFile(0.1::second, 80.0, kick);
            } else if (beat == 22) {
                playClarinetAndSoundFile(0.1::second, 200.0, kick);
            } else  if (beat == 23) {
                playClarinet(0.6::second, 230.0); 
            }
            counter++;
        }
       cicle++; 
    }  
    <<<"Left time: ",(now - melodyDuration) / second>>>; 
}

function void playClarinetAndSoundFile(dur noteDuration, float f, SndBuf soundFile) {
    // Set volume
    0.1 => master.gain;
    // Set frequency
    f => clar.freq;
    // Trigger envelope
    1 => env.keyOn;
    // Advance time
    noteDuration => now;
    // Tell the envelope to ramp down
    1 => env.keyOff;
    
    // Set volume
    0.3 => master.gain;
    // To play sound file
    0 => soundFile.pos;
    // Advance time
    noteDuration => now;
}

function void playClarinet(dur noteDuration, float f) {
    // Set volume
    0.1 => master.gain;
    // Set frequency
    f => clar.freq;
    // Trigger envelope
    1 => env.keyOn;
    // Advance time
    noteDuration => now;
    // Tell the envelope to ramp down
    1 => env.keyOff;
}

function void playToyPianoKey(int cicle) {
    // Set volume
    0.2 => master.gain;
    for (0 => int i; i < cicle; i++) {
        0 => toy_piano_key.pos;
        duration_sample => now;
        <<<"Left time: ",(now - melodyDuration) / second>>>;
    }
}

// MAIN PROGRAM
spork ~ clarinet(2);
space * 12 => now;
spork ~ playToyPianoKey(5); 
// To keep parent shred alive, in order for children to alive
while(true) 1::second => now;




