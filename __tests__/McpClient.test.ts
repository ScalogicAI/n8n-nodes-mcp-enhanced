import { McpClientEnhanced } from '../nodes/McpClient/McpClientEnhanced.node';

describe('McpClientEnhanced Node', () => {
	let mcpClient: McpClientEnhanced;

	beforeEach(() => {
		mcpClient = new McpClientEnhanced();
	});

	it('should have the correct node type', () => {
		expect(mcpClient.description.name).toBe('mcpClientEnhanced');
	});

	it('should have properties defined', () => {
		expect(mcpClient.description.properties).toBeDefined();
	});
});
