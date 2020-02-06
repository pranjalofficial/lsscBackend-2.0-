using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblAssessmentBatch
    {
        public TblAssessmentBatch()
        {
            TblAssessmentProof = new HashSet<TblAssessmentProof>();
            TblFinalResult = new HashSet<TblFinalResult>();
            TblPracticalResult = new HashSet<TblPracticalResult>();
            TblTheoryResult = new HashSet<TblTheoryResult>();
            TblTotalPracticalMarks = new HashSet<TblTotalPracticalMarks>();
        }

        public int AsId { get; set; }
        public string AsType { get; set; }
        public string AsPartner { get; set; }
        public string AsState { get; set; }
        public string AsCity { get; set; }
        public string AsQpId { get; set; }
        public int AsQuestionBankId { get; set; }
        public int AsQuestionPaperVersion { get; set; }
        public int AsTheoryQuestionId { get; set; }
        public int AsPracticalQuestionId { get; set; }
        public string AsFacilitator { get; set; }
        public string AsSdmsbatchName { get; set; }
        public string AsCenterId { get; set; }
        public string AsProjectId { get; set; }
        public string AsContactPerson { get; set; }
        public long? AsContactPersonPhoneNo { get; set; }
        public string AsContactPersonEmailId { get; set; }
        public DateTime AsTrainingStartDate { get; set; }
        public DateTime AsTrainingEndDate { get; set; }
        public DateTime AsAssesmentStartDate { get; set; }
        public DateTime AsAssesmentEndtDate { get; set; }
        public TimeSpan? AsAssessmentStartTime { get; set; }
        public TimeSpan? AsAssessmentEndTime { get; set; }
        public string AsRegionalLang { get; set; }
        public string AsRemarks { get; set; }

        public TblCenter AsCenter { get; set; }
        public TblPracticalQuestion AsPracticalQuestion { get; set; }
        public TblProject AsProject { get; set; }
        public TblQp AsQp { get; set; }
        public TblQuestionBank AsQuestionBank { get; set; }
        public TblQuestionPaperVersion AsQuestionPaperVersionNavigation { get; set; }
        public TblTheoryQuestions AsTheoryQuestion { get; set; }
        public ICollection<TblAssessmentProof> TblAssessmentProof { get; set; }
        public ICollection<TblFinalResult> TblFinalResult { get; set; }
        public ICollection<TblPracticalResult> TblPracticalResult { get; set; }
        public ICollection<TblTheoryResult> TblTheoryResult { get; set; }
        public ICollection<TblTotalPracticalMarks> TblTotalPracticalMarks { get; set; }
    }
}
