using System;
using System.Collections.Generic;
using System.Text;

namespace CtrlShift
{
    public class FutureShiftModel
    {
        public int? ShiftId { get; set; }
        public int? ShiftTypeId { get; set; }
        public int? EmployeeId { get; set; }
        public DateTime? Started { get; set; }
        public DateTime? Ended { get; set; }

        public FutureShiftModel() { }

        public FutureShiftModel(FutureShift futureShift)
        {
            ShiftId = futureShift.ShiftId;
            ShiftTypeId = futureShift.ShiftTypeId;
            EmployeeId = futureShift.EmployeeId;
            Started = futureShift.Started;
            Ended = futureShift.Ended;
        }

        public FutureShift ConvertToFutureShift()
        {
            FutureShift futureShift = new FutureShift
            {
                ShiftId = ShiftId,
                ShiftTypeId = ShiftTypeId,
                EmployeeId = EmployeeId,
                Started = Started,
                Ended = Ended
            };
            return futureShift;
        }


    }
}
