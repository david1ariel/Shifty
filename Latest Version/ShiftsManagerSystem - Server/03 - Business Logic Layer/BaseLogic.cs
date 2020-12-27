using System;
using System.Collections.Generic;
using System.Text;

namespace CtrlShift
{
    public abstract class BaseLogic: IDisposable
    {
        public TomediaShiftsManagementContext db = new TomediaShiftsManagementContext();
        protected readonly TomediaShiftsManagementContext DB;

        public BaseLogic() { }

        public BaseLogic(TomediaShiftsManagementContext DB)
        {
            this.DB = DB;
        }

        public void Dispose()
        {
            DB.Dispose();
        }
    }
}
