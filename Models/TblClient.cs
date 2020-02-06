using System;
using System.Collections.Generic;

namespace LSSCBackEnd.Models
{
    public partial class TblClient
    {
        public TblClient()
        {
            TblProject = new HashSet<TblProject>();
        }

        public string ClientId { get; set; }
        public string ClientName { get; set; }
        public string ClientAddress { get; set; }
        public string ClientContactPerson { get; set; }
        public long ClientContactNo { get; set; }
        public string ClientEmailId { get; set; }
        public bool ClientActive { get; set; }

        public ICollection<TblProject> TblProject { get; set; }
    }
}
