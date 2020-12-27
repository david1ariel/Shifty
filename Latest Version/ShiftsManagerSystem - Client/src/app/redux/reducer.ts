import { Action } from './action';
import { ActionType } from './action-type';
import { AppState } from './app-state';




export function reducer(currentState: AppState, action: Action): AppState {

    const newState: AppState = { ...currentState };

    switch (action.type) {

        // david start
        case ActionType.Register:
        case ActionType.Login:
            newState.employee = action.payload;
            console.log(JSON.stringify(newState.employee));
            sessionStorage.setItem("employee", JSON.stringify(newState.employee));
            break;

        case ActionType.Logout:
            newState.employee = null;
            sessionStorage.removeItem("employee");
            break;

        case ActionType.GetAllEmployees:
            newState.employees = action.payload;
            break;

        case ActionType.AddEmployee:
            newState.employees.push(action.payload);
            break;

        case ActionType.UpdateEmployee:
            newState.employees[action.payload.employeeId] = action.payload;
            break;

        case ActionType.DeleteEmployee:
            newState.employees.slice(action.payload, 1);
            break;

        case ActionType.GetAllBusiness:
            newState.business = action.payload;
            break;

        case ActionType.AddBusiness:
            newState.business.push(action.payload);
            break;

        case ActionType.UpdateBusiness:
            newState.business[action.payload.BusinessId] = action.payload;
            break;

        case ActionType.DeleteBusiness:
            newState.business.slice(action.payload, 1);
            break;

        case ActionType.GetAllShiftsToDispaly:
            newState.shiftsToDisplay = action.payload;
            break;

        case ActionType.GetAllShifts:
            newState.shifts = action.payload;
            break;

        case ActionType.AddShift:
            newState.shifts.push(action.payload);
            break;

        case ActionType.UpdateShift:
            newState.shifts[action.payload.ShiftsId] = action.payload;
            break;

        case ActionType.DeleteShift:
            newState.shifts.slice(action.payload, 1);
            break;

        case ActionType.GetAllFutureShifts:
            newState.futureShifts = action.payload;
            break;

        case ActionType.AddFutureShift:
            newState.futureShifts.push(action.payload);
            break;

        case ActionType.UpdateFutureShift:
            newState.futureShifts[action.payload.futureShiftsId] = action.payload;
            break;

        case ActionType.DeleteFutureShift:
            newState.futureShifts.slice(action.payload, 1);
            break;

        case ActionType.GetAllShiftTypes:
            newState.shiftTypes = action.payload;
            break;

        case ActionType.AddShiftType:
            newState.shiftTypes.push(action.payload);
            break;

        case ActionType.UpdateShiftType:
            newState.shiftTypes[action.payload.ShiftTypeId] = action.payload;
            break;

        case ActionType.DeleteShiftType:
            newState.shiftTypes.slice(action.payload, 1);
            break;

        case ActionType.AddFutureShiftEmployee:
            newState.futureShiftsEmployees.push(action.payload);
            break;

        case ActionType.GetAllFutureShiftsEmployees:
            newState.futureShiftsEmployees = action.payload;
            break;

        case ActionType.GetAllFutureShiftsEmployeesById:
            newState.futureShiftsEmployeesById = action.payload;
            break;

        // david end
    }
    return newState;
}
