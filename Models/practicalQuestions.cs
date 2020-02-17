using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LSSCBackEnd.Models
{
    public class practicalQuestions
    {
        public int PqCode { get; set; }
        public string PqQuestion { get; set; }
        public string PqNos { get; set; }
        public string PqType { get; set; }
        public int PqMarks { get; set; }
        public int? PqVersionOfQb { get; set; }
        public string NosName { get; set; }
    }
}
