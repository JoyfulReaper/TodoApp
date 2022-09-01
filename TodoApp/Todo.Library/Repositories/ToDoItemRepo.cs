using Todo.Library.Models;

namespace Todo.Library.Repositories;
public class ToDoItemRepo
{
	private readonly IDataAccess _dataAccess;

	public ToDoItemRepo(IDataAccess dataAccess)
	{
		_dataAccess = dataAccess;
	}

    public async Task SaveAsync(ToDoItem toDoItem)
    {
        int id = await _dataAccess.SaveDataAndGetIdAsync("spTodoItem_Upsert", new
        {
            toDoItem.ToDoItemId,
            toDoItem.ToDoListId,
            toDoItem.Name,
            toDoItem.DateCompleted,
            toDoItem.DateDeleted
        }, "Data");
        toDoItem.ToDoItemId = id;
    }

    public async Task<ToDoItem?> GetAsync(int toDoItemId)
    {
        return (await _dataAccess.LoadDataAsync<ToDoItem, dynamic>("spTodoItem_Get", new { toDoItemId }, "Data"))
            .SingleOrDefault();
    }
}
