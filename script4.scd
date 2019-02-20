

s.boot


(Ndef(\x2,{
	arg freq, freq1, amp;
	var sig;
	sig = Saw.ar([freq, freq - 1], amp/3) + SinOsc.ar(20,0,amp);
	sig = sig + Saw.ar([freq1,freq1+1], amp/3);
	sig = sig + Saw.ar([freq1/2,freq1+1/2], amp/3);
	sig = FreeVerb.ar(sig,0.7, 0.8, 0.6 );
	//La linea de abajo es para
	//limitar la señal por seguridad
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
}))

Ndef(\x2).playN([1])
Ndef(\x2).set(\freq, 96, \freq1, 119, \amp, 0.2)

(
Tdef(\hit,{

	1.do{
		Ndef(\x2).playN([0,1]);

	80.do{

		Ndef(\x2).set(\freq, 96, \freq1, 119, \amp, 0.7);
		"uno".postln;
		[0.1, 0.01, 0.1, 0.05].choose.wait;

		Ndef(\x2).set(\amp, 0);
		"dos".postln;
		0.1.wait;

		Ndef(\x2).set(\freq, 96, \freq1, 119, \amp, 0.7);
		"uno".postln;
		[0.1,0.01,0.05,0.2].choose.wait;

		Ndef(\x2).set(\amp, 0);
		"dos".postln;
		0.1.wait;

}}})
)
Tdef(\hit).play
