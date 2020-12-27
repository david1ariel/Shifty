using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CtrlShift
{
    public class ShiftsLogic: BaseLogic
    {
        public ShiftsLogic(TomediaShiftsManagementContext DB): base(DB) { }

        //public static List<PastShiftModel> shifts = DB.PastShifts().

        //public static List<List<PastShiftModel>> shiftsToDisplay = makeShifts2DList();

        //public static List<List<PastShiftModel>> makeShifts2DList()
        //{

        //    List<PastShiftModel> tempShifts = new List<PastShiftModel>();
        //    for (int i = 1; i <= shifts.Count; i++)
        //    {
        //        var results6 = shifts.Where(s => s.ShiftTypeId == i);
        //        foreach (var item in results6)
        //        {
        //            tempShifts.Add(item);
        //        }
        //        shiftsToDisplay.Add(tempShifts);
        //    }

        //    return shiftsToDisplay;
        //}

        public List<PastShiftModel> GetAllPastShifts()
        {
            return DB.PastShifts.Select(p => new PastShiftModel(p)).ToList();
        }

        public PastShiftModel GetSinglePastShift(int id)
        {
            return new PastShiftModel(DB.PastShifts.SingleOrDefault(p => p.ShiftId == id));
        }

        public PastShiftModel AddPastShiftModel(PastShiftModel pastShiftModel)
        {
            PastShift pastShift = pastShiftModel.ConvertToPastShift();
            DB.PastShifts.Add(pastShift);
            DB.SaveChanges();
            pastShiftModel.ShiftId = pastShift.ShiftId;
            return pastShiftModel;
        }

        public PastShiftModel UptdateFullPastShift(PastShiftModel pastShiftModel)
        {
            PastShift pastShift = DB.PastShifts.SingleOrDefault(e => e.ShiftId == pastShiftModel.ShiftId);
            if (pastShift == null)
                return null;
            pastShift.ShiftTypeId = pastShiftModel.ShiftTypeId;
            pastShift.EmployeeId = pastShiftModel.EmployeeId;
            pastShift.Started = pastShiftModel.Started;
            pastShift.Ended = pastShiftModel.Ended;
            
            DB.SaveChanges();
            return pastShiftModel;
        }

        public PastShiftModel UptdatePartialPastShift(PastShiftModel pastShiftModel)
        {
            PastShift pastShift = DB.PastShifts.SingleOrDefault(p => p.ShiftId == pastShiftModel.ShiftId);
            if (pastShift == null)
                return null;

            if (pastShift.ShiftTypeId != null)
                pastShift.ShiftTypeId = pastShiftModel.ShiftTypeId;

            if (pastShift.EmployeeId != null)
                pastShift.EmployeeId = pastShiftModel.EmployeeId;

            if (pastShift.Started != null)
                pastShift.Started = pastShiftModel.Started;

            if (pastShift.Ended != null)
                pastShift.Ended = pastShiftModel.Ended;
            
            DB.SaveChanges();
            return pastShiftModel;
        }

        public void DeletePastShift(int id)
        {
            PastShift pastShiftToDelete = DB.PastShifts.SingleOrDefault(p => p.ShiftId == id);
            if (pastShiftToDelete == null)
                return;
            DB.PastShifts.Remove(pastShiftToDelete);
            DB.SaveChanges();
        }





        public List<FutureShiftModel> GetAllFutureShifts()
        {
            return DB.FutureShifts.Select(p => new FutureShiftModel(p)).ToList();
        }

        public FutureShiftModel GetSingleFutureShift(int id)
        {
            return new FutureShiftModel(DB.FutureShifts.SingleOrDefault(p => p.ShiftId == id));
        }

        public FutureShiftModel AddFutureShiftModel(FutureShiftModel futureShiftModel)
        {
            FutureShift futureShift = futureShiftModel.ConvertToFutureShift();
            DB.FutureShifts.Add(futureShift);
            DB.SaveChanges();
            futureShiftModel.ShiftId = futureShift.ShiftId;
            return futureShiftModel;
        }

        public FutureShiftModel UptdateFullFutureShift(FutureShiftModel futureShiftModel)
        {
            FutureShift futureShift = DB.FutureShifts.SingleOrDefault(f => f.ShiftId == futureShiftModel.ShiftId);
            if (futureShift == null)
                return null;
            futureShift.ShiftTypeId = futureShiftModel.ShiftTypeId;
            futureShift.EmployeeId = futureShiftModel.EmployeeId;
            futureShift.Started = futureShiftModel.Started;
            futureShift.Ended = futureShiftModel.Ended;

            DB.SaveChanges();
            return futureShiftModel;
        }

        public FutureShiftModel UptdatePartialFutureShift(FutureShiftModel futureShiftModel)
        {
            FutureShift futureShift = DB.FutureShifts.SingleOrDefault(f => f.ShiftId == futureShiftModel.ShiftId);
            if (futureShift == null)
                return null;

            if (futureShift.ShiftTypeId != null)
                futureShift.ShiftTypeId = futureShiftModel.ShiftTypeId;

            if (futureShift.EmployeeId != null)
                futureShift.EmployeeId = futureShiftModel.EmployeeId;

            if (futureShift.Started != null)
                futureShift.Started = futureShiftModel.Started;

            if (futureShift.Ended != null)
                futureShift.Ended = futureShiftModel.Ended;

            DB.SaveChanges();
            return futureShiftModel;
        }

        public void DeleteFutureShift(int id)
        {
            FutureShift futureShiftToDelete = DB.FutureShifts.SingleOrDefault(p => p.ShiftId == id);
            if (futureShiftToDelete == null)
                return;
            DB.FutureShifts.Remove(futureShiftToDelete);
            DB.SaveChanges();
        }





        public List<ShiftTypeModel> GetAllShiftTypes()
        {
            return DB.ShiftTypes.Select(p => new ShiftTypeModel(p)).ToList();
        }

        public ShiftTypeModel GetSingleShiftType(int id)
        {
            return new ShiftTypeModel(DB.ShiftTypes.SingleOrDefault(p => p.ShiftTypeId == id));
        }

        public ShiftTypeModel AddShiftTypeModel(ShiftTypeModel shiftTypeModel)
        {
            ShiftType shiftType = shiftTypeModel.ConvertToShiftType();
            DB.ShiftTypes.Add(shiftType);
            DB.SaveChanges();
            shiftTypeModel.ShiftTypeId = shiftType.ShiftTypeId;
            return shiftTypeModel;
        }

        public ShiftTypeModel UptdateFullShiftType(ShiftTypeModel shiftTypeModel)
        {
            ShiftType futureShift = DB.ShiftTypes.SingleOrDefault(s => s.ShiftTypeId == shiftTypeModel.ShiftTypeId);
            if (futureShift == null)
                return null;
            futureShift.TypeTitle= shiftTypeModel.TypeTitle;
            futureShift.Starts = shiftTypeModel.Starts;
            futureShift.Ends = shiftTypeModel.Ends;

            DB.SaveChanges();
            return shiftTypeModel;
        }

        public ShiftTypeModel UptdatePartialShiftType(ShiftTypeModel shiftTypeModel)
        {
            ShiftType shiftType = DB.ShiftTypes.SingleOrDefault(s => s.ShiftTypeId == shiftTypeModel.ShiftTypeId);
            if (shiftType == null)
                return null;

            if (shiftType.TypeTitle != null)
                shiftType.TypeTitle = shiftTypeModel.TypeTitle;

            if (shiftType.Starts != null)
                shiftType.Starts = shiftTypeModel.Starts;

            if (shiftType.Ends != null)
                shiftType.Ends = shiftTypeModel.Ends;

            DB.SaveChanges();
            return shiftTypeModel;
        }

        public void DeleteShiftType(int id)
        {
            ShiftType shiftTypeToDelete = DB.ShiftTypes.SingleOrDefault(p => p.ShiftTypeId == id);
            if (shiftTypeToDelete == null)
                return;
            DB.ShiftTypes.Remove(shiftTypeToDelete);
            DB.SaveChanges();
        }


    }
}
