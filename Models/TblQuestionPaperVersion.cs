using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblQuestionPaperVersion
    {
        public TblQuestionPaperVersion()
        {
            TblAssessmentBatch = new HashSet<TblAssessmentBatch>();
            TblPracticalQuestion = new HashSet<TblPracticalQuestion>();
            TblTheoryQuestions = new HashSet<TblTheoryQuestions>();
        }

        public int QvId { get; set; }
        public int? QvQlId { get; set; }
        public string QvName { get; set; }
        public string QvType { get; set; }

        public ICollection<TblAssessmentBatch> TblAssessmentBatch { get; set; }
        public ICollection<TblPracticalQuestion> TblPracticalQuestion { get; set; }
        public ICollection<TblTheoryQuestions> TblTheoryQuestions { get; set; }
    }
}
