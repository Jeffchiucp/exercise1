Are average scores for hospital quality or procedural variability correlated with patient survey responses?

For this question there were two different questions asked, and the first is the correlation between hospital quality scores and survey scores. Both scores are from the best_hospitals analysis. Quality_score takes the average of base_score and consistency_score, and survey_score comes from a standardized average of all survey responses. The correlation between these two are very high, as expected: higher-scoring hospitals are likely to get higher survey results, and lower-scoring hospitals are likely to get lower survey results:

>>SELECT ROUND(CORR(CAST(a.survey_score AS DOUBLE), CAST(a.quality_score AS DOUBLE)),2) as corr FROM (SELECT DISTINCT h.provider_id, h.hospital_name, h.survey_score, (h.base_score + h.consistency_score)/2 quality_score FROM hospital_summary_scores h) a;

>>0.84

The next correlation analysis done is between procedural variance and survey scores. It is harder to imagine a clear relationship between these two variables, as procedural variance sounds like a fairly independent variable from survey scores, and it turns out to be so:

>>SELECT ROUND(CORR(CAST(h.survey_score AS DOUBLE), CAST(a.sd AS DOUBLE)),2) as corr FROM (SELECT provider_id, STDDEV_POP(score) as sd FROM effective_care_tr GROUP BY provider_id) a INNER JOIN hospital_summary_scores h ON (a.provider_id = h.provider_id);

>>-0.23

Despite the weak relationship, the slight negative correlation can be made sense of when thinking about the nature of variance. It's plausible to see that the higher the procedural variance (ie the hospital is not very consistent in its ability to carry out procedures), then survey scores will tend to be lower, and if variance is tighter, then survey scores are likely to be higher. Procedural variance is defintely not as closely related a variable as quality score with survey score, but we see a relationship that makes sense nonetheless.