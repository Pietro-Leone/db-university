-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(`id`) AS "numero_iscritti" , YEAR(`enrolment_date`) AS "anno_accademico"
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address` AS "indirizzo_edificio", COUNT(`id`) AS "num_insegnanti"
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id` AS "appello_esame" , AVG(`vote`) AS "media_voti"
FROM `exam_student`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id` AS "dipartimento", COUNT(`id`) AS "num_corsi_laurea"
FROM `degrees`
GROUP BY `department_id`;