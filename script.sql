#loop, while, for, foreach
#rotulos exit continue

#Quando você tem um loop você pode dar um rótulo para ele
#quando existe um loop aninhado, sai do mais interno
DO $$
DECLARE
    i INT;
    j INT;
BEGIN
    i := 0;
    <<externo>> --nome do loop 1
    LOOP
        i:= i + 1;
        EXIT WHEN i > 10;
        j :=1 ;
        <<interno>> --nome do loop 2
        LOOP
            RAISE NOTICE '%, %', i, j;
            j := j + 1;
            -- EXIT WHEN j > 10;
            -- EXIT externo WHEN j> 5;
            EXIT WHEN j > 5;
        END LOOP;
    END LOOP;
END;
$$

-- DO $$
-- DECLARE
--     contador INT := 0;
-- BEGIN
--     LOOP
--         contador := contador + 1;
--         EXIT WHEN contador > 100;
--         IF contador % 7 = 0 THEN
--             CONTINUE; --não execute o restante da iteração atual
--         END IF;
--         CONTINUE WHEN contador % 11 = 0;
--         RAISE NOTICE '%', contador;
--     END LOOP;
-- END;
-- $$

-- DO $$
-- DECLARE
--     contador INT := 1;
-- BEGIN
--     LOOP
--         RAISE NOTICE '%', contador;
--         contador := contador +1;
--         EXIT WHEN contador > 10;
--     END LOOP;
-- END;
-- $$


-- DO $$
-- DECLARE
--     contador INT := 1;
-- BEGIN
--     LOOP
--         RAISE NOTICE '%', contador;
--         contador := contador + 1;
--         IF contador > 10 THEN
--             EXIT;
--         END IF;
--     END LOOP;
-- END;
-- DO $$
-- BEGIN
--     LOOP
--         RAISE NOTICE 'TESTANDO NOSSO PRIMEIRO LOOP...';
--     END LOOP;
-- END;
--$$