--exception
DO $$
DECLARE
    a INT := fn_valor_aleatorio_entre(0,2);
BEGIN
    IF a = 0 THEN
        RAISE 'O divisor não pode ser zero';
    ELSE
        RAISE NOTICE 'Valor de a é %', a;
    END IF;
EXCEPTION WHEN OTHERS THEN --funciona para erros não listados pela pgsql
    -- tratamento seção 2.5.1
    --SQLState
    --SQLERRM
    RAISE NOTICE 'exceção: %, %', SQLSTATE, SQLERRM;

END;
$$

-- DO $$
-- BEGIN
--     RAISE NOTICE 'Começando ...';
--     RAISE NOTICE '%', 1/0;
--     RAISE NOTICE 'Terminando ...';
-- EXCEPTION
--     --fluxo alternativo de execução quando o fluxo principal falha
--     WHEN division_by_zero THEN --aqui o division_by_zero é um erro documento no pgsql
--         RAISE NOTICE 'Não é possível fazer divisão por zero';
-- END;
-- $$




--#loop, while, for, foreach
--#rotulos exit continue

-- DO $$
-- BEGIN
--     FOR i IN 1..100 LOOP
--         INSERT INTO tb_aluno(nota) VALUES (fn_valor_aleatorio_entre (0,10));
--     END LOOP;
-- END;
-- $$

-- CREATE TABLE tb_aluno (
--     cod_aluno SERIAL PRIMARY KEY,
--     nota INT
-- );

-- DO $$
-- DECLARE

-- BEGIN
--     -- plpgsql RAISE NOTICE 'De 1 a 50, pulando de dois em dois';
--     RAISE NOTICE 'De 1 a 50, pulando de dois em dois';
--     FOR i IN 1..50 BY 2 LOOP
--         RAISE NOTICE 'Número: %', i;
--     END LOOP;
    -- RAISE NOTICE 'E agora?';
    -- FOR i IN  REVERSE 10..1 LOOP
    --     RAISE NOTICE '%', i;
    -- END LOOP;
    -- RAISE NOTICE 'de 1 a 10 pulando de um em um';
    -- FOR i IN 1..10 LOOP --não precisa declarar o i
    --     RAISE NOTICE '%', i;
    -- END LOOP;

-- END;
-- $$

--Quando você tem um loop você pode dar um rótulo para ele
--quando existe um loop aninhado, sai do mais interno
-- DO $$
-- DECLARE
--     i INT;
--     j INT;
-- BEGIN
--     i := 0;
--     <<externo>> --nome do loop 1
--     LOOP
--         i:= i + 1;
--         EXIT WHEN i > 10;
--         j :=1 ;
--         <<interno>> --nome do loop 2
--         LOOP
--             RAISE NOTICE '%, %', i, j;
--             j := j + 1;
--             -- EXIT WHEN j > 10;
--             -- EXIT externo WHEN j> 5;
--             EXIT WHEN j > 5;
--         END LOOP;
--     END LOOP;
-- END;
-- $$

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