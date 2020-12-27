import { Router } from '@angular/router';
import { AuthService } from './../../services/auth.service';
import { CredentialsModel } from './../../models/credentials.model';
import { Component, OnInit } from '@angular/core';
import { environment } from 'src/environments/environment';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
})
export class LoginComponent {

    public credentials = new CredentialsModel();

    constructor(private myAuthService: AuthService, private router: Router) { }

    public async login() {
        const success = await this.myAuthService.login(this.credentials);
        if (success)
            this.router.navigateByUrl("home");

        else
            alert("Incorrect username or password!");
    }

}
