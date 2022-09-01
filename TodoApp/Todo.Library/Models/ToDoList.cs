namespace Todo.Library.Models;

public class ToDoList
{
    public int ToDoListId { get; set; }
    public string UserId { get; set; } = null!;
    public string Name { get; set; } = null!;
    public DateTime DateCreated { get; set; }
    public DateTime? DateDeleted { get; set; }
}
