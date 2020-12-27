import { Time } from '@angular/common';

export class ShiftTypeModel {
    public constructor(
        public shiftTypeId?: number,
        public  typeTitle?: string,
        public  starts?: Time,
        public  ends?: Time
    ){}
    
}
