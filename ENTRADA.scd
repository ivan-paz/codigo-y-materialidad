//   script 3

(Ndef(\x,{
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
	sig = sig + Saw.ar([freq,freq+1],amp/3);
	sig = FreeVerb.ar(sig,SinOsc.kr(0.05),0.8);
	//La linea de abajo es para
	//limitar la señal por seguridad
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
});

Ndef(\x2,{
	arg freq, freq1, amp;
	var sig;
	sig = Saw.ar([freq, freq - 1], amp/3);
	sig = sig + Saw.ar([freq1,freq1+1], amp/3);
	sig = FreeVerb.ar(sig,SinOsc.kr(0.01),0.8);
	//La linea de abajo es para
	//limitar la señal por seguridad
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
}))







(
Tdef(\ambiente,{

	1.do{
		Ndef(\x).playN([0]);
		Ndef(\x1).playN([1]);
		Ndef(\x2).playN([1]);

	3.do{

		Ndef(\x).set(\freq, 155,  \amp, 0.1);
		Ndef(\x1).set(\freq, 155.05,  \amp, 0.9);
		Ndef(\x2).set(\freq, 96, \freq1, 119, \amp, 0.9);
		"uno".postln;
		30.wait;

		Ndef(\x).set(\freq, 119,  \amp, 0.1);
		Ndef(\x1).set(\freq, 96,  \amp, 0.9);
		Ndef(\x2).set(\freq, 178, \freq1, 119, \amp, 0.9);
		"dos".postln;
		30.wait;

		Ndef(\x).set(\freq, 119,  \amp, 0.1);
		Ndef(\x1).set(\freq, 96,  \amp, 0.9);
		Ndef(\x2).set(\freq, 178, \freq1, 150, \amp, 0.9);
		"tres".postln;
		30.wait;
	};
		Ndef(\x).set(\amp, 0.15);
		Ndef(\x1).set(\amp, 0.15);
		Ndef(\x2).set(\amp, 0.15);

		Ndef(\x).set( \amp, 0.1);
		Ndef(\x1).set( \amp, 0.1);
		Ndef(\x2).set( \amp, 0.1);

		Ndef(\x).set(\amp, 0.05);
		Ndef(\x1).set(\amp, 0.05);
		Ndef(\x2).set(\amp, 0.05);

		Ndef(\x).stop;
		Ndef(\x1).stop;
		Ndef(\x2).stop;
	}

})
)
Tdef(\ambiente).play











