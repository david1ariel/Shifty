using System;
using System.Collections.Generic;
using System.Text;

namespace CtrlShift
{
    public class ShiftTypeModel
    {
        public int? ShiftTypeId { get; set; }
        public string TypeTitle { get; set; }
        public TimeSpan Starts { get; set; }
        public TimeSpan Ends { get; set; }

        public ShiftTypeModel() { }

        public ShiftTypeModel(ShiftType shiftType)
        {
            ShiftTypeId = shiftType.ShiftTypeId;
            TypeTitle = shiftType.TypeTitle;
            Starts = shiftType.Starts;
            Ends = shiftType.Ends;
        }

        public ShiftType ConvertToShiftType()
        {
            ShiftType shiftType = new ShiftType
            {
                ShiftTypeId = ShiftTypeId,
                TypeTitle = TypeTitle,
                Starts = Starts,
                Ends = Ends
            };
            return shiftType;
        }
    }
}
