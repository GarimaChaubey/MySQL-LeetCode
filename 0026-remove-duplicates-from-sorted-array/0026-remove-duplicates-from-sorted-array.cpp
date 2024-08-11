class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        if (nums.empty()) return 0; // Edge case: empty array

    int k = 1; // k is the index for the next unique element
    for (int i = 1; i < nums.size(); i++) {
        if (nums[i] != nums[i - 1]) {
            nums[k] = nums[i]; // Assign the unique element
            k++; // Increment the unique count
        }
    }
    return k;
    }
};