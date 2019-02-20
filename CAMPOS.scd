(Ndef(\x,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);
	//La linea de abajo es para
	//limitar la señal por seguridad
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
}))

Ndef(\x).playN([0,1]);

Ndef(\x).set(\freq, 100,  \amp, 0.1);