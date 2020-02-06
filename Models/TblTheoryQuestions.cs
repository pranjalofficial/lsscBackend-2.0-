using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblTheoryQuestions
    {
        public TblTheoryQuestions()
        {
            TblAssessmentBatch = new HashSet<TblAssessmentBatch>();
        }

        public int TqCode { get; set; }
        public string TqQuestion { get; set; }
        public string TqOption1 { get; set; }
        public string TqOption2 { get; set; }
        public string TqOption3 { get; set; }
        public string TqOption4 { get; set; }
        public int TqCorrectAnswer { get; set; }
        public int TqMarks { get; set; }
        public int? TqVersionOfQb { get; set; }

        public TblQuestionPaperVersion TqVersionOfQbNavigation { get; set; }
        public ICollection<TblAssessmentBatch> TblAssessmentBatch { get; set; }
    }
}
