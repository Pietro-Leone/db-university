-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname` , `degrees`.`name` AS "corso_laurea"
FROM `students`
INNER JOIN `degrees`
	ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name`= "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `departments`.`name` AS "dipartimento" , `degrees`.`name` AS "corsi_laurea"
FROM `degrees`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`department_id` = 7
	AND `degrees`.`level` = "magistrale";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name` AS "nome" , `teachers`.`surname` AS "cognome" , `courses`.`name` AS "nome_corso"
FROM `course_teacher`
INNER JOIN `teachers`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
	ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo 
-- dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name` AS "nome", `students`.`surname` AS "cognome" , `degrees`.`name` AS "corso_di_laurea" , `departments`.`name` AS "dipartimento"
FROM `students`
INNER JOIN `degrees`
	ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`name` , `students`.`surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS "corso_di_laurea" , `courses`.`name` AS "nome_insegnamento" , `teachers`.`name` AS "nome_docente"
FROM `degrees`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `departments`.`name` AS "nome_dipartimento" , `teachers`.`name` AS "nome_docente" , `teachers`.`surname` AS "cognome_docente"
FROM `teachers`
INNER JOIN `course_teacher`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`id` = 5;


-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il 
-- voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.
