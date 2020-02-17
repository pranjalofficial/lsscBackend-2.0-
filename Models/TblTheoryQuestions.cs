using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblTheoryQuestions
    {
        public int TqCode { get; set; }
        public string TqQuestion { get; set; }
        public string TqOption1 { get; set; }
        public string TqOption2 { get; set; }
        public string TqOption3 { get; set; }
        public string TqOption4 { get; set; }
        public int TqCorrectAnswer { get; set; }
        public int TqMarks { get; set; }
        public int? TqVersionOfQb { get; set; }
        public byte[] TqImg { get; set; }
        public string TqTamilQuestion { get; set; }
        public string TqHindiQuestion { get; set; }
        public string TqBengaliQuestion { get; set; }
        public string TqTamilOption1 { get; set; }
        public string TqTamilOption2 { get; set; }
        public string TqTamilOption3 { get; set; }
        public string TqTamilOption4 { get; set; }
        public string TqHindiOption1 { get; set; }
        public string TqHindiOption2 { get; set; }
        public string TqHindiOption3 { get; set; }
        public string TqHindiOption4 { get; set; }
        public string TqBengaliOption1 { get; set; }
        public string TqBengaliOption2 { get; set; }
        public string TqBengaliOption3 { get; set; }
        public string TqBengaliOption4 { get; set; }

        public TblQuestionPaperVersion TqVersionOfQbNavigation { get; set; }
    }
}
