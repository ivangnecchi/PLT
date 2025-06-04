VAR
    Allarmi    : ARRAY[1..1000] OF INT;  (* Valore diverso da 0 = allarme attivo *)
    AllarmiOld : ARRAY[1..1000] OF INT;  (* Stato precedente degli allarmi *)
    NewAlarm   : BOOL := FALSE;          (* Vale 1 solo se si attiva un nuovo allarme *)
    NewAlarmCount : INT := 0;            (* Numero di nuovi allarmi rilevati nel ciclo *)
END_VAR

(* Esecuzione ciclica *)
NewAlarm := FALSE;             (* Reset a inizio ciclo *)
NewAlarmCount := 0;            (* Contatore nuovi allarmi *)
FOR i := 1 TO 1000 DO
    (* Allarme nuovo se ora è diverso da zero ma prima era zero *)
    IF (Allarmi[i] <> 0) AND (AllarmiOld[i] = 0) THEN
        NewAlarm := TRUE;
        NewAlarmCount := NewAlarmCount + 1;
    END_IF;
    AllarmiOld[i] := Allarmi[i];  (* Aggiorna lo stato precedente *)
END_FOR;
