import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { EmployeeModel } from '../models/employee.model';
import { environment } from '../../environments/environment';
import { store } from '../redux/store';
import { ActionType } from '../redux/action-type';
import { CredentialsModel } from '../models/credentials.model';

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    constructor(private Http: HttpClient) { }

    public async register(employee: EmployeeModel): Promise<boolean> {
        try {
            const registeredEmployee = await this.Http.post<EmployeeModel>(environment.authBaseUrl + "/register", employee).toPromise();
            store.dispatch({ type: ActionType.Register, payload: registeredEmployee });
            return true;
        }
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            return false;
        }
    }

    public async login(credentials: CredentialsModel): Promise<boolean> {
        try {
            const loggedInEmployee = await this.Http.post<EmployeeModel>(environment.authBaseUrl + "/login", credentials).toPromise();
            store.dispatch({ type: ActionType.Login, payload: loggedInEmployee });
            return true;
        }
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            
            return false;
            
        }
    }

    public logout(): void {
        store.dispatch({ type: ActionType.Logout });
    }
}
