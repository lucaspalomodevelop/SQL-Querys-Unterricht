SELECT  unterricht.Zeitpunkt as Zeitpunkt, klasse.name as klasse, fach.name as fach, lehrer.name as lehrer FROM unterricht left join klasse on klasse.id = unterricht.klassen_id left JOIN lehrer ON lehrer.id = unterricht.lehrer_id LEFT join fach on fach.id = unterricht.fach_id ORDER by unterricht.Zeitpunkt