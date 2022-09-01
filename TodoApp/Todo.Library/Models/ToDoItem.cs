namespace Todo.Library.Models;

public class ToDoItem
{
    public int ToDoItemId { get; set; }
    public int ToDoListId { get; set; }
    public string Name { get; set; } = null!;
    public DateTime DateCreated { get; set; }
    public DateTime? DateCompleted { get; set; }
    public DateTime? DateDeleted { get; set; }
}
