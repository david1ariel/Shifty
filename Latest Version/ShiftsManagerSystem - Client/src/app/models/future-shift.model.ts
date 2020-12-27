export class FutureShiftModel {
    public constructor(
        public shiftId?: number,
        public shiftTypeId?: number,
        public employeeId?: number,
        public started?: Date,
        public ended?: Date
    ){}
}
