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
Ndef(\x).set(\freq, 240,  \amp, 0.2)

s.meter



(
// Tdef quiere decir Task definition
Tdef(\tarea,{

	1.do{
		Ndef(\x).playN([0,1]);
		Ndef(\x).set(\freq, 300,  \amp, 0.5);
		180.wait;

        Ndef(\x).playN([0,1]);
		Ndef(\x).set(\freq, 400,  \amp, 0.4);
		180.wait;

		Ndef(\x).stop;
		"ya estubo".postln
	}

})
)
Tdef(\tarea).play












