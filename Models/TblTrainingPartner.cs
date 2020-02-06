using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblTrainingPartner
    {
        public TblTrainingPartner()
        {
            TblCenter = new HashSet<TblCenter>();
        }

        public int TpCode { get; set; }
        public string TpName { get; set; }
        public bool TpActive { get; set; }

        public ICollection<TblCenter> TblCenter { get; set; }
    }
}
