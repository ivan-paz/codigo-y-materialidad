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
})
)
Ndef(\x).playN([0])
Ndef(\x).set(\freq, 200,  \amp, 0.3)

(
Ndef(\x1,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);
	//La linea de abajo es para
	//limitar la señal por seguridad
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
})
)
Ndef(\x1).playN([1])
Ndef(\x1).set(\freq, 200,  \amp, 0.3)