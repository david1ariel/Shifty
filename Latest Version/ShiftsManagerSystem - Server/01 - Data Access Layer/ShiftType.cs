using System;
using System.Collections.Generic;

namespace CtrlShift
{
    public partial class ShiftType
    {
        public ShiftType()
        {
            PastShifts = new HashSet<PastShift>();
        }

        public int? ShiftTypeId { get; set; }
        public string TypeTitle { get; set; }
        public TimeSpan Starts { get; set; }
        public TimeSpan Ends { get; set; }

        public virtual FutureShift FutureShift { get; set; }
        public virtual ICollection<PastShift> PastShifts { get; set; }
    }
}
