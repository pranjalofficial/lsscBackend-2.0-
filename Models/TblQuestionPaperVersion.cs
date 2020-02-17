using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblQuestionPaperVersion
    {
        public TblQuestionPaperVersion()
        {
            TblAssessmentBatchAsPracticalQuestion = new HashSet<TblAssessmentBatch>();
            TblAssessmentBatchAsTheoryQuestionPaperVersionNavigation = new HashSet<TblAssessmentBatch>();
            TblPracticalQuestion = new HashSet<TblPracticalQuestion>();
            TblTheoryQuestions = new HashSet<TblTheoryQuestions>();
        }

        public int QvId { get; set; }
        public int? QvQlId { get; set; }
        public string QvName { get; set; }
        public string QvType { get; set; }
        public int? QvEnglish { get; set; }
        public int? QvHindi { get; set; }
        public int? QvTamil { get; set; }
        public int? QvBangali { get; set; }

        public TblQuestionBank QvQl { get; set; }
        public ICollection<TblAssessmentBatch> TblAssessmentBatchAsPracticalQuestion { get; set; }
        public ICollection<TblAssessmentBatch> TblAssessmentBatchAsTheoryQuestionPaperVersionNavigation { get; set; }
        public ICollection<TblPracticalQuestion> TblPracticalQuestion { get; set; }
        public ICollection<TblTheoryQuestions> TblTheoryQuestions { get; set; }
    }
}
