import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
@Component({
  selector: 'app-slidebar',
  templateUrl: './slidebar.component.html',
  styleUrl: './slidebar.component.css',
  standalone: true,
  imports: [FormsModule],
  providers: [AuthService],
})
export class SlidebarComponent {
  constructor(private router: Router, private authService: AuthService) {}
  logout() {
    this.router.navigate(['/login-medico']);
    this.authService.logout();
  }
}
