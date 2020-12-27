import { FutureShiftEmployeeModel } from './../models/future-shift-employee.model';
import { ShiftModel } from './../models/shift.model';
import { BusinessModel } from './../models/business-model';
import { EmployeeModel } from '../models/employee.model';

export class AppState {
    public employees: EmployeeModel[] = [];
    public employee: EmployeeModel = null; 
    public business: BusinessModel[] = []
    public shifts: ShiftModel[] = [];
    public futureShifts: ShiftModel[] = [];
    public shiftTypes: ShiftModel[] = [];
    public shiftsToDisplay: string="";
    public futureShiftsEmployees: FutureShiftEmployeeModel[] = [];
    public futureShiftsEmployeesById: FutureShiftEmployeeModel[] = [];


    public constructor() {
        this.employees = [];
        this.employee = JSON.parse(sessionStorage.getItem("employee")); 
        this.business = [];
        this.shifts = [];
        this.shiftsToDisplay="";
        this.futureShiftsEmployees = [];
        this.futureShiftsEmployeesById = [];
    }
}
