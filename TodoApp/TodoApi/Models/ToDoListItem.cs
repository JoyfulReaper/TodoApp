namespace Todo.Api.Models;

public class ToDoListItem
{
    public int ToDoListItemId { get; set; }
    public int ToDoListId { get; set; }
    public string Name { get; set; } = null!;
    public DateTime DateCreated { get; set; }
    public DateTime? DateCompleted { get; set; }
    public DateTime? DateDeleted { get; set; }
}
