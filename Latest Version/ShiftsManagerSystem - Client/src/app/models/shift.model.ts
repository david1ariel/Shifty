export class ShiftModel{
    public constructor(
        public shiftId?: number,
        public shiftTypeId?: number,
        public employeeId?: number,
        public started?: string,
        public ended?: string
    ){}
}