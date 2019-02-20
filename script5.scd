//   script 2

para encender el servidor de audio hay que declarar la siguiente linea:

s.boot

luego para probar si funciona ejecuta esta linea:

{SinOsc.ar()}.play

//para apagar todo el sonido
en mac    cmd + .

en linux  ctrl  +  .


//  ahora si
//  tenemos un Ndef
{SinOsc.ar(40)}.scope

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
Ndef(\x).playN([0,1])
Ndef(\x).set(\freq, 240,  \amp, 0)
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
s.meter

(
Tdef(\tarea,{

	3.do{
		Ndef(\x).playN([0,1]);
		Ndef(\x1).playN([0,1]);

		Ndef(\x).set(\freq, 28.78 * 4,  \amp, 0.5);
		90.wait;

		Ndef(\x).set(\freq, 28.78 * 8,  \amp, 0.4);
		90.wait;

		Ndef(\x1).set(\freq, 28.78 * 4,  \amp, 0.5);
		Ndef(\x).set(\freq, 28.78 * (3/2) * 4,  \amp, 0.5);
		90.wait;
	};
	     Ndef(\x).stop;
	     Ndef(\x1).stop;
		"ya estubo".postln

})
)
Tdef(\tarea).play












