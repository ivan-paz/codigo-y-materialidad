(
Tdef(\ambiente,{

		Ndef(\x).playN([0]);
		Ndef(\x1).playN([1]);
		Ndef(\x2).playN([1]);

	3.do{

		Ndef(\x).set(\freq, 155,  \amp, 0.2);
		Ndef(\x1).set(\freq, 155.05,  \amp, 0.2);
		Ndef(\x2).set(\freq, 96, \freq1, 119, \amp, 0.2);
		"uno".postln;
		10.wait;

		Ndef(\x).set(\freq, 119,  \amp, 0.2);
		Ndef(\x1).set(\freq, 96,  \amp, 0.2);
		Ndef(\x2).set(\freq, 178, \freq1, 119, \amp, 0.2);
		"dos".postln;
		5.wait;

		Ndef(\x).set(\freq, 119,  \amp, 0.2);
		Ndef(\x1).set(\freq, 96,  \amp, 0.2);
		Ndef(\x2).set(\freq, 178, \freq1, 150, \amp, 0.2);
		"dos".postln;
		10.wait;
	};

	2.do{

		Ndef(\x).set(\freq, 200,  \amp, 0.2);
		Ndef(\x1).set(\freq, 155.05,  \amp, 0.2);
		Ndef(\x2).set(\freq, 96, \freq1, 119, \amp, 0.2);
		"uno".postln;
		10.wait;

		Ndef(\x).set(\freq, 119,  \amp, 0.2);
		Ndef(\x1).set(\freq, 200,  \amp, 0.2);
		Ndef(\x2).set(\freq, 178, \freq1, 119, \amp, 0.2);
		"dos".postln;
		5.wait;

		Ndef(\x).set(\freq, 200,  \amp, 0.2);
		Ndef(\x1).set(\freq, 96,  \amp, 0.2);
		Ndef(\x2).set(\freq, 178, \freq1, 150, \amp, 0.2);
		"dos".postln;
		10.wait;
	};
		Ndef(\x).set(\amp, 0.15);
		Ndef(\x1).set(\amp, 0.15);
		Ndef(\x2).set(\amp, 0.15);
        5.wait;
		Ndef(\x).set( \amp, 0.1);
		Ndef(\x1).set( \amp, 0.1);
		Ndef(\x2).set( \amp, 0.1);
        5.wait;
		Ndef(\x).set(\amp, 0.05);
		Ndef(\x1).set(\amp, 0.05);
		Ndef(\x2).set(\amp, 0.05);

		Ndef(\x).stop;
		Ndef(\x1).stop;
		Ndef(\x2).stop;

})
)
Tdef(\ambiente).play

