## Performance Matrics ##
The following are used as performance metrics for biometric systems:

  * **false accept rate or false match rate (FAR or FMR):** the probability that the system incorrectly matches the input pattern to a non-matching template in the database. It measures the percent of invalid inputs which are incorrectly accepted.

  * **false reject rate or false non-match rate (FRR or FNMR):** the probability that the system fails to detect a match between the input pattern and a matching template in the database. It measures the percent of valid inputs which are incorrectly rejected.

  * **receiver operating characteristic or relative operating characteristic ( ROC):** The ROC plot is a visual characterization of the trade-off between the FAR and the FRR. In general, the matching algorithm performs a decision based on a threshold which determines how close to a template the input needs to be for it to be considered a match. If the threshold is reduced, there will be less false non-matches but more false accepts. Correspondingly, a higher threshold will reduce the FAR but increase the FRR. A common variation is the Detection error trade-off (DET), which is obtained using normal deviate scales on both axes. This more linear graph illuminates the differences for higher performances (rarer errors).

  * **equal error rate or crossover error rate (EER or CER):** the rate at which both accept and reject errors are equal. The value of the EER can be easily obtained from the ROC curve. The EER is a quick way to compare the accuracy of devices with different ROC curves. In general, the device with the lowest EER is most accurate.

  * **failure to enroll rate (FTE or FER):** the rate at which attempts to create a template from an input is unsuccessful. This is most commonly caused by low quality inputs.

  * **failure to capture rate (FTC):** Within automatic systems, the probability that the system fails to detect a biometric input when presented correctly.

  * **template capacity:** the maximum number of sets of data which can be stored in the system.