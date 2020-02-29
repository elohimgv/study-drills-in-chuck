// Sound chain
SndBuf mySound[9];
// Object Gain to control the volume
Gain master => dac;

mySound[0] => master;
mySound[1] => master;
mySound[2] => master;
mySound[3] => master;
mySound[4] => master;
mySound[5] => master;
mySound[6] => master;
mySound[7] => master;
mySound[8] => master;

me.dir() + "/audio/grain_01.wav" => mySound[0].read;
me.dir() + "/audio/grain_02.wav" => mySound[1].read;
me.dir() + "/audio/grain_03.wav" => mySound[2].read;
me.dir() + "/audio/grain_04.wav" => mySound[3].read;
me.dir() + "/audio/grain_05.wav" => mySound[4].read;
me.dir() + "/audio/grain_06.wav" => mySound[5].read;
me.dir() + "/audio/grain_07.wav" => mySound[6].read;
me.dir() + "/audio/grain_08.wav" => mySound[7].read;
me.dir() + "/audio/grain_09.wav" => mySound[8].read;

// Begin with a silence 
0.0 => master.gain;
// Pick a random number between 0 and #sound files
Math.random2(0, mySound.cap() - 1) => int which;
<<<"sound file without sound: ", which>>>;
0 => mySound[which].pos;
mySound[which].samples()::samp => now;

0.5 => master.gain;
while (true) {
    // Pick a random number between 0 and #sound files
    Math.random2(0, mySound.cap() - 1) => int which;
    <<<"sound file: ", which>>>;
    // Play the sample
    0 => mySound[which].pos;
    // Let it play
    mySound[which].samples()::samp => now; 
}




