using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblPc
    {
        public string PcCode { get; set; }
        public string PcName { get; set; }
        public string PcDescp { get; set; }
        public bool PcActive { get; set; }
        public string PcNoscode { get; set; }

        public TblNos PcNoscodeNavigation { get; set; }
    }
}
