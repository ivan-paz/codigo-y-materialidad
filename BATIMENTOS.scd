//  batimentos
//Server.default.options.outDevice_("QUAD-CAPTURE")
s.boot
(
Ndef(\x,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);
	//La linea de abajo es para
	//limitar la señal por seguridad
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
});
Ndef(\x1,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);
	//La linea de abajo es para
	//limitar la señal por seguridad
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
});

SynthDef(\acordeon,{
	arg freq= 60, freq1=67, freq2=64,  out = 0;
	var sig, sig1, sig2;
	sig =  Saw.ar([freq.midicps - XLine.kr(0.0001,0.3,300), freq.midicps + 1], 0.2)*EnvGen.kr(Env.new([0,0.1,0.2,0.1,0],[60, 60, 120,60]));
	sig1 = Pulse.ar(freq1.midicps - XLine.kr(0.0001,1,300), 0.2,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0],[60, 120, 120] ));
	sig2 = Saw.ar([freq2.midicps, freq2.midicps + 1.1], 0.2) * EnvGen.kr(Env.new([0,0.2,0],             [150,150]));
	sig = sig + sig1 + sig2;
	sig = sig!2;
	Compander.ar(sig);
	sig = LPF.ar(sig;, 2000);
	sig = HPF.ar(sig,100);
	Out.ar(out, sig * 4)
}).add;
)



(
Tdef(\batimentos,{

	1.do{
		Ndef(\x).playN([0]);
		Ndef(\x).set(\freq, 200,  \amp, 0.1);
		Ndef(\x1).playN([1]);
		Ndef(\x1).set(\freq, 200,  \amp, 1);

		120.wait;

		Synth(\acordeon);

		360.wait;

		Ndef(\x).stop;
		Ndef(\x1).stop;
	}
})
)

Tdef(\batimentos).play









