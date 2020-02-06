using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LSSCBackEnd.Models
{
    public class CenterAssesor
    {
        public int AsId { get; set; }
        public string AsContactPerson { get; set; }
        public string AsSdmsbatchName { get; set; }
        public string CenterName { get; set; }
        public int AsTheoryQuestionId { get; set; }
        public int AsPracticalQuestionId { get; set; }
    }
}
