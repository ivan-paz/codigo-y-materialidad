s.boot

// sonido y sus propiedades
frecuencia
amplitud
forma de onda
fase

autekre

//  Fenomenos acusticos
sombra acustica
reflexion
ondas estacionarias (modos del cuarto o del espacio)
reverberacion

// direccionalidad de las fuentes
direccional
omnidireccional
Espacializacion

//   como modificamos el espacio o cómo lo definimos con estos elementos?????


//Estructuras que voy a utilizar
//Ndef
//SynthDef

(
Ndef(\nombre,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);

	//////////////////////////////
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
})
)
Ndef(\nombre).set(\freq, 200,  \amp, 0.9)
Ndef(\nombre).playN([0])

(
Ndef(\x,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);

	//////////////////////////////
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
})
)

Ndef(\x).set(\freq, 200.5,  \amp, 0.9)

Ndef(\x).playN([1])

(
Ndef(\x1,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);

	//////////////////////////////
	sig = Limiter.ar(sig,1);/////
	////////////////////////////
})
)
Ndef(\x1).set(\freq, 100.5,  \amp, 0.6)
Ndef(\x1).playN([1])


////
(
Ndef(\iliana,{
	arg freq = 1, luna = 0.1;
	var sig;
	sig = SinOsc.ar(freq,0,luna);

	sig = Limiter.ar(sig,1)

})
)
Ndef(\iliana).playN([0])

Ndef(\iliana).set(\freq, 0,  \luna, 0)
Ndef(\iliana).stop













(
Ndef(\x,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq,0,amp);
	sig = Limiter.ar(sig, 1);
})
)


Ndef(\x).playN([0,1])

Ndef(\x).set(\freq, 150, \freq1, 70, \amp, 0.2)

Ndef(\x).set(\freq, 100, \freq1, 50, \amp, 0.2)

Ndef(\x).stop






(SynthDef(\primero,{
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
Synth(\primero)
(
SynthDef(\segundo,{
	arg freq= 60, freq1= 67, freq2=64,  out = 0;
	var sig, sig1, sig2;
	sig =  Saw.ar(freq.midicps, 0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0.1, 0], [120, 60, 60,60]));
	sig1 = Pulse.ar([freq1.midicps + freq1.midicps + 1], 0.2,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0],[120, 120, 60] ));
	sig2 = Saw.ar([freq2.midicps, freq2.midicps - 1] ,0.2) * EnvGen.kr(Env.new([0,0.2,0],             [150,150]));
	sig = sig + sig1 + sig2;
	sig = sig!2;
	sig = Resonz.ar(sig, 261.62);
	Out.ar(out, sig * 4)
}).add)
Synth(\segundo)