package Start.Model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
 
@Entity
public class Login {
 
    private Integer id;
    private String username;
    private String password;
    
 
    public Login() {
    }
 
    public Login(String username, String password) {
        this.username = username;
        this.password = password;
    }
 
    @Id
    @GeneratedValue(strategy = IDENTITY)
 
    @Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }
 
    public void setId(Integer id) {
        this.id = id;
    }
 
    @Column(name = "username", length = 30)
    public String getUsername() {
        return this.username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
 
    @Column(name = "password", length = 32)
    public String getPassword() {
        return this.password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
}