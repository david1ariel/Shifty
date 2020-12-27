using System;
using System.Collections.Generic;

namespace CtrlShift
{
    public partial class PastShift
    {
        public int? ShiftId { get; set; }
        public int? ShiftTypeId { get; set; }
        public int? EmployeeId { get; set; }
        public DateTime? Started { get; set; }
        public DateTime? Ended { get; set; }

        public virtual Employee Employee { get; set; }
        public virtual ShiftType ShiftType { get; set; }
    }
}
