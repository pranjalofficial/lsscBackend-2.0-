using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblQuestionBank
    {
        public TblQuestionBank()
        {
            TblAssessmentBatch = new HashSet<TblAssessmentBatch>();
        }

        public int QbCode { get; set; }
        public string QbName { get; set; }
        public string QbCategory { get; set; }
        public string QbDesp { get; set; }
        public string QbRelatedQp { get; set; }

        public TblQp QbRelatedQpNavigation { get; set; }
        public ICollection<TblAssessmentBatch> TblAssessmentBatch { get; set; }
    }
}
