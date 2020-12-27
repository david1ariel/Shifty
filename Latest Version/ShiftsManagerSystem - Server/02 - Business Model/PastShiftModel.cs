using System;
using System.Collections.Generic;
using System.Text;

namespace CtrlShift
{
    public class PastShiftModel
    {
        public int? ShiftId { get; set; }
        public int? ShiftTypeId { get; set; }
        public int? EmployeeId { get; set; }
        public DateTime? Started { get; set; }
        public DateTime? Ended { get; set; }

        public PastShiftModel() { }

        public PastShiftModel(PastShift pastShift)
        {
            ShiftId = pastShift.ShiftId;
            ShiftTypeId = pastShift.ShiftTypeId;
            EmployeeId = pastShift.EmployeeId;
            Started = pastShift.Started;
            Ended = pastShift.Ended;
        }

        public PastShift ConvertToPastShift()
        {
            PastShift pastShift = new PastShift {
                ShiftId = ShiftId,
                ShiftTypeId = ShiftTypeId,
                EmployeeId = EmployeeId,
                Started = Started,
                Ended = Ended
            };
            return pastShift;
        }
    }
}
