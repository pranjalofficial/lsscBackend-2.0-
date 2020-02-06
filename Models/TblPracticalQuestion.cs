using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblPracticalQuestion
    {
        public TblPracticalQuestion()
        {
            TblAssessmentBatch = new HashSet<TblAssessmentBatch>();
            TblPracticalResult = new HashSet<TblPracticalResult>();
        }

        public int PqCode { get; set; }
        public string PqQuestion { get; set; }
        public string PqNos { get; set; }
        public string PqType { get; set; }
        public int PqMarks { get; set; }
        public int? PqVersionOfQb { get; set; }

        public TblNos PqNosNavigation { get; set; }
        public TblQuestionPaperVersion PqVersionOfQbNavigation { get; set; }
        public ICollection<TblAssessmentBatch> TblAssessmentBatch { get; set; }
        public ICollection<TblPracticalResult> TblPracticalResult { get; set; }
    }
}
