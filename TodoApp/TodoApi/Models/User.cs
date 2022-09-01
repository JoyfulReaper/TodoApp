namespace Todo.Api.Models;

public class User
{
    public string UserId { get; set; } = null!;
    public string EmailAddress { get; set; } = null!;
    public DateTime DateCreated { get; set; }
}
