s.boot
(
SynthDef(\escucha,{
	arg out = 1;
	var sig;
	sig =  SinOsc.ar(XLine.kr(200,300,300), 0, 0.4)*EnvGen.kr(Env.new([0,0.7,0],[15,300,15]));
	Out.ar(out, sig)
}).add;
)

Synth(\escucha)