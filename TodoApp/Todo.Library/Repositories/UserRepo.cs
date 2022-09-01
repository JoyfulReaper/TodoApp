using Todo.Library.Models;

namespace Todo.Library.Repositories;

public class UserRepo
{
	private readonly IDataAccess _dataAccess;

	public UserRepo(IDataAccess dataAccess)
	{
		_dataAccess = dataAccess;
	}

	public async Task SaveAsync(User user)
	{
		await _dataAccess.SaveDataAsync("spUser_Upsert", new
		{
			user.UserId,
			user.EmailAddress,
			user.DateCreated,
		}, "Data");
	}

	public async Task<User?> GetAsync(string userId)
	{
		return (await _dataAccess.LoadDataAsync<User, dynamic>("spUser_Get", new { userId }, "Data"))
			.SingleOrDefault();
	}
}
